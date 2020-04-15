From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Support DRM bridges on NVIDIA Tegra
Date: Wed, 15 Apr 2020 19:00:31 +0300
Message-ID: <c7567d52-4d42-4e70-4cc5-92311c53da04@gmail.com>
References: <20200414222007.31306-1-digetx@gmail.com>
 <20200415095324.GB30444@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200415095324.GB30444-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

15.04.2020 12:53, Sam Ravnborg пишет:
> Hi Dimitry.
> 
> Added Laurent that is the arthitecht behind the new bridge model
> briefly explained below.
> 
> On Wed, Apr 15, 2020 at 01:20:05AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This small series adds initial support for the DRM bridges to NVIDIA Tegra
>> DRM driver. This is required by newer device-trees where we model the LVDS
>> encoder bridge properly.
>>
>> Please note that the first "Support DRM bridges" patch was previously sent
>> out as a standalone v1 change.
>>
>> Changelog:
>>
>> v2: - Added the new "rgb: Don't register connector if bridge is used"
>>       patch, which hides the unused connector provided by the Tegra DRM
>>       driver when bridge is used, since bridge provides its own connector
>>       to us.
> 
> We are moving to a model where the display driver have the
> responsibility to create the connector - not the bridge.
> 
> The flags argument to:
> 
>     drm_bridge_attach(encoder, bridge, previous, flags);
> 
> is used to tell if the brigde shall create the connector or the display
> driver does it - DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> It would be preferred that we moved the relevant bridge drivers to the
> new model no so you did not need to support the old model in the driver.

Hello Sam,

Thank you very much for the clarification! To be honest, I was a bit
confused by the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

Perhaps would be nice if the code told explicitly that drivers should
use the new flag because it appeared to me that adding bridge functions
to the DRM driver is a step backwards since looks like it involves
writing some more code :)

> If you help identify the bridge drivers we could migrate them to the new
> model and you could help testing?
> 
> What bridge drivers will be used for tegra?

It's lvds-encoder of bridge/lvds-codec.c, which supports the new model.

I'll try to move to the new model in v3. Thanks again!
