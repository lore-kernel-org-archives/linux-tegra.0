From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: DTS: tegra: add DFLL integration to the Dalmore
 DTS file
Date: Mon, 13 Jan 2014 22:36:21 -0800
Message-ID: <alpine.DEB.2.02.1401132233450.11672@tamien>
References: <20131219122857.3226.42830.stgit@tamien> <20131219124929.3226.79335.stgit@tamien> <52B38AE9.2030209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52B38AE9.2030209-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On Thu, 19 Dec 2013, Stephen Warren wrote:

> On 12/19/2013 05:49 AM, Paul Walmsley wrote:
>> Expose the DFLL device on the NVIDIA Tegra114 Dalmore board, and connect
>> the DFLL (and FCPU cluster) voltage regulator.
>
>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra114-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra114-dfll.txt
>
>> +NVIDIA Tegra114 DFLL clocksource data in the board DTS file
>> +
>> +Optional properties:
>> +
>> +- status : device availability -- managed by the DT integration code, not
>> +           the DFLL driver.  Should be set to "okay" if the DFLL is to be
>> +           used on this board type.
>
> There's certainly no need to document the same DT property twice.

I've just dropped this section, per your earlier suggestion.

- Paul
