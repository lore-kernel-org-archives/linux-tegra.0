From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 0/2] Panel rotation patches
Date: Sun, 8 Mar 2020 22:25:30 +0300
Message-ID: <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com>
References: <20200306002112.255361-1-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200306002112.255361-1-dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

06.03.2020 03:21, Derek Basehore пишет:
> This adds the plumbing for reading panel rotation from the devicetree
> and sets up adding a panel property for the panel orientation on
> Mediatek SoCs when a rotation is present.

Hello Derek and everyone,

I'm looking at adding display rotation support to NVIDIA Tegra DRM
driver because some devices have display panel physically mounted
upside-down, and thus, display controller's scan-out needs to be rotated
by 180° in this case.

Derek, yours panel-rotation patches add support for assigning panel's
orientation to the connector, but then only primary display plane
receives rotation value in [1], while rotation needs to be applied to
all available overlay/cursor planes and this should happen in other
places than [1] as well.

[1] drm_client_modeset_commit_atomic()

Please also note that in a case of the scan-out rotation, plane's
coordinates need to be changed in accordance to the display's rotation.

I looked briefly through the DRM code and my understanding that the DRM
core currently doesn't support use-case where scan-out needs to rotated
based on a panel's orientation, correct? Is it the use-case you're
working on for the Mediatek driver?
