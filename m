From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Support DRM bridges on NVIDIA Tegra
Date: Wed, 15 Apr 2020 11:53:24 +0200
Message-ID: <20200415095324.GB30444@ravnborg.org>
References: <20200414222007.31306-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200414222007.31306-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dimitry.

Added Laurent that is the arthitecht behind the new bridge model
briefly explained below.

On Wed, Apr 15, 2020 at 01:20:05AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> This small series adds initial support for the DRM bridges to NVIDIA Tegra
> DRM driver. This is required by newer device-trees where we model the LVDS
> encoder bridge properly.
> 
> Please note that the first "Support DRM bridges" patch was previously sent
> out as a standalone v1 change.
> 
> Changelog:
> 
> v2: - Added the new "rgb: Don't register connector if bridge is used"
>       patch, which hides the unused connector provided by the Tegra DRM
>       driver when bridge is used, since bridge provides its own connector
>       to us.

We are moving to a model where the display driver have the
responsibility to create the connector - not the bridge.

The flags argument to:

    drm_bridge_attach(encoder, bridge, previous, flags);

is used to tell if the brigde shall create the connector or the display
driver does it - DRM_BRIDGE_ATTACH_NO_CONNECTOR.

It would be preferred that we moved the relevant bridge drivers to the
new model no so you did not need to support the old model in the driver.

If you help identify the bridge drivers we could migrate them to the new
model and you could help testing?

What bridge drivers will be used for tegra?

	Sam
