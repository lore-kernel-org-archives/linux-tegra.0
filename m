From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Date: Fri, 17 Apr 2020 01:22:57 +0300
Message-ID: <481f003b-78d2-51b4-ce7a-b917abea8ac7@gmail.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
 <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
 <20200416205012.GA28162@pendragon.ideasonboard.com>
 <fbafa641-f2ed-22b5-eaeb-bd2726b53d0a@gmail.com>
 <20200416213919.GB28162@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200416213919.GB28162-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

17.04.2020 00:39, Laurent Pinchart пишет:
> Hi Dmitry,
> 
> On Fri, Apr 17, 2020 at 12:15:33AM +0300, Dmitry Osipenko wrote:
>> 16.04.2020 23:50, Laurent Pinchart пишет:
>>> On Thu, Apr 16, 2020 at 11:21:40PM +0300, Dmitry Osipenko wrote:
>>>> 16.04.2020 21:52, Dmitry Osipenko пишет:
>>>> ...
>>>>>> May I also recommend switching to the DRM panel bridge helper ? It will
>>>>>> simplify the code.
>>>>>
>>>>> Could you please clarify what is the "DRM panel bridge helper"?
>>>>>
>>>>> I think we won't need any additional helpers after switching to the
>>>>> bridge connector helper, no?
>>>>
>>>> Actually, I now see that the panel needs to be manually attached to the
>>>> connector.
>>>
>>> The DRM panel bridge helper creates a bridge from a panel (with
>>> devm_drm_panel_bridge_add()). You can then attach that bridge to the
>>> chain, like any other bridge, and the enable/disable operations will be
>>> called automatically without any need to call the panel enable/disable
>>> manually as done currently.
>>>
>>>> Still it's not apparent to me how to get panel out of the bridge. It
>>>> looks like there is no such "panel helper" for the bridge API or I just
>>>> can't find it.
>>>
>>> You don't need to get a panel out of the bridge. You should get the
>>> bridge as done today,
>>
>> You mean "get the panel", correct?
> 
> Yes, sorry.
> 
>>> and wrap it in a bridge with
>>> devm_drm_panel_bridge_add().
>>>
>>
>> The lvds-codec already wraps panel into the bridge using
>> devm_drm_panel_bridge_add() and chains it for us, please see
>> lvds_codec_probe() / lvds_codec_attach().
>>
>> Does it mean that lvds-codec is not supporting the new model?
> 
> No, that *is* the new model :-) As I think I've commented during review,
> when you have an LVDS encoder and a panel, you don't need to handle the
> panel at all. When you have an RGB panel connected directly to the RGB
> output, you need to wrap it in a bridge, exactly the same way as
> lvds-codec does for its panel.
> 
>> Everything works nicely using the old model, where bridge creates
>> connector and attaches panel to it for us.
>>
>> [I'm still not sure what is the point to use the new model in a case of
>> a simple chain of bridges]
>>
>> Using the new model, the connector isn't created by the bridge, so I
>> need to duplicate that creation effort in the driver. Once the bridge
>> connector is manually created, I need to attach panel to this connector,
>> but panel is reachable only via the remote bridge (which wraps the panel).
>>
>> driver connector -> LVDS bridge -> panel bridge -> panel
> 
> With the new model,
> 
> 1. The display driver and the bridge drivers need to get hold of the
>    bridge directly connected to their output (for instance with
>    of_drm_find_panel()). If the output is connected to a panel, they
>    need to wrap that panel in a bridge (with
>    devm_drm_panel_bridge_add()). I plan, in the future, to make creation
>    of panel bridges automatic, so drivers won't have to care.
> 
> 2. The display driver needs to create a dummy drm_encoder for each of
>    its outputs (for instance with drm_simple_encoder_init()).
> 
> 3. The display driver needs to create a drm_connector for each of its
>    outputs, and implement connector operations by delegating them to the
>    bridges in the pipeline. Unless there's a good reason not to do so,
>    this should be done with drm_bridge_connector_init().
> 
> That's it. Every driver then focusses on its own needs, bridge drivers
> handle only the device they're associated with, and the DRM core and DRM
> bridge connector helper will handle all the rest.
> 

Thank you very much for the clarification again! :)

Now I realized what was the missing part.. in my case display panel is
mounted upside-down and display output needs to be rotated by 180°. I
have a local patch (hack) that adds orientation-property support to the
panel-lvds driver and previously the panel's orientation was assigned to
the connector using drm_panel_attach(), but now this attachment doesn't
happen and I found that panel_lvds_get_modes() missed
drm_connector_set_panel_orientation() in my patch. Everything is okay
once the panel_lvds_get_modes() is corrected. I'll prepare the v4.
