<?php


namespace Modules\PromoteFreelancer\Http\PageBuilder\Promotion;

use App\Models\Project;
use App\Service;
use plugins\PageBuilder\Fields\ColorPicker;
use plugins\PageBuilder\Fields\Number;
use plugins\PageBuilder\Fields\Slider;
use plugins\PageBuilder\Fields\Text;
use plugins\PageBuilder\PageBuilderBase;
use plugins\PageBuilder\Traits\LanguageFallbackForPageBuilder;


class ProjectPromotion extends PageBuilderBase
{
    use LanguageFallbackForPageBuilder;

    public function preview_image()
    {
        return 'home-page/popular-project-one.png';
    }

    public function admin_render()
    {
        $output = $this->admin_form_before();
        $output .= $this->admin_form_start();
        $output .= $this->default_fields();
        $widget_saved_values = $this->get_settings();


        $output .= Text::get([
            'name' => 'title',
            'label' => __('Title'),
            'value' => $widget_saved_values['title'] ?? null,
        ]);

        $output .= Number::get([
            'name' => 'items',
            'label' => __('Items'),
            'value' => $widget_saved_values['items'] ?? null,
            'info' => __('enter how many item you want to show in frontend'),
        ]);

        $output .= Slider::get([
            'name' => 'padding_top',
            'label' => __('Padding Top'),
            'value' => $widget_saved_values['padding_top'] ?? 260,
            'max' => 500,
        ]);

        $output .= Slider::get([
            'name' => 'padding_bottom',
            'label' => __('Padding Bottom'),
            'value' => $widget_saved_values['padding_bottom'] ?? 190,
            'max' => 500,
        ]);
        $output .= ColorPicker::get([
            'name' => 'section_bg',
            'label' => __('Background Color'),
            'value' => $widget_saved_values['section_bg'] ?? null,
            'info' => __('select color you want to show in frontend'),
        ]);

        $output .= $this->admin_form_submit_button();
        $output .= $this->admin_form_end();
        $output .= $this->admin_form_after();

        return $output;
    }


    public function frontend_render()
    {
        $settings = $this->get_settings();
        $title =$settings['title'];
        $items =$settings['items'] ?? 5;
        $padding_top = $settings['padding_top'];
        $padding_bottom = $settings['padding_bottom'];
        $section_bg = $settings['section_bg'] ?? '';
        $current_date = \Carbon\Carbon::now()->toDateTimeString();

        $promoted_projects = Project::query()->with('project_creator')
            ->whereHas('project_creator')
            ->select(['id', 'title','slug','user_id','basic_regular_charge','basic_discount_charge','basic_delivery','description','image','pro_expire_date','is_pro','load_from'])
            ->where('project_on_off','1')
            ->where('pro_expire_date','>',$current_date)
            ->where('is_pro','yes')
            ->where('status','1')
            ->take($items)
            ->inRandomOrder()
            ->get();

        return  $this->renderBlade('projects.promoted-projects',compact(['title','items','padding_top','padding_bottom','section_bg','promoted_projects']));
    }

    public function addon_title()
    {
        return __('Promotional Project: 01');
    }
}
