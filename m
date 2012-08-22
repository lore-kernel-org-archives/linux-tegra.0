From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Wed, 22 Aug 2012 14:42:33 +0300
Message-ID: <5034C5A9.4010102@nvidia.com>
References: <50323513.3090606@nvidia.com> <20120820131800.GA13785@avionic-0098.mockup.avionic-design.de> <1345527561.31608.152.camel@markz-desktop> <20120821054256.GA5325@avionic-0098.mockup.avionic-design.de> <1345529761.31608.169.camel@markz-desktop> <20120821145709.GA701@avionic-0098.mockup.avionic-design.de> <50349B58.4000809@nvidia.com> <20120822103309.GB31448@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120822103309.GB31448-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 22.08.2012 13:33, Thierry Reding wrote:
> This is used to determine when the DRM driver can be safely initialized.
> Basically the host1x driver scans the DT for display controllers and
> outputs and adds them to this list if they are available. When the
> drivers for those device call host1x_register_client(), they'll be moved
> to the drm_active list and once the the drm_clients list becomes empty,
> the DRM driver is registered using the call to drm_soc_init().

Ok, thanks for clarifying.

> I'm not sure how this can be solved any better than the above. All the
> drivers are inherently tied to host1x anyway. That's why I suggested
> putting the host1x driver along with the DRM driver in the last version
> of these patches so that we can get the initial support written. If the
> functionality is required by other drivers we have two options, either
> the API is exported from the DRM driver or the host1x driver is moved to
> a more central location where other drivers can use it.

Ok, let's go with tight coupling now. Once I have code ready, I'll do
the necessary tricks to do some decoupling.

Terje
