From: PERIER Romain <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/5] mfd: tps65910: Convert ti,system-power-controller
 DT property to poweroff-source
Date: Thu, 23 Oct 2014 11:39:34 +0200
Message-ID: <CABgxDoKm5kKKCTD1njAerUrM24iVcGRDuhJ7b4qBVPqKBC4ftQ@mail.gmail.com>
References: <1413991587-11110-1-git-send-email-romain.perier@gmail.com>
	<20141023081230.GK32045@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141023081230.GK32045-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "pawel.moll" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

2014-10-23 10:12 GMT+02:00 Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
> This breaks DT ABI stability right? An existing device tree using ti,system-power-controller won't work anymore after this patch right? I don't think that's acceptable.
>

This is why I converted all dts which use "ti,system-power-controller"
and tps65910/tps65911 to the new property (everything is in the
patches serie). However, with an existing dtb it will no longer work,
yes.
What do you suggest ? keep these two properties in the driver ? :/

I mean, this is a standardization, so all the corresponding dts must
be updated and rebuilt... Like when you change something in a
dt-binding, you should update and rebuilt the dts... I Don't compute.

Romain
