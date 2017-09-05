From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v2 0/6] Host1x and VIC support for Tegra186
Date: Tue, 5 Sep 2017 14:28:59 +0300
Message-ID: <408624d4-9e69-661a-950f-b8d8386d6a27@kapsi.fi>
References: <20170905084306.19318-1-mperttunen@nvidia.com>
 <20170905111031.u4damueklnuliqt4@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170905111031.u4damueklnuliqt4-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sgurrappadi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.09.2017 14:10, Daniel Vetter wrote:
>
> Since this is new hw support, is there also open source userspace using
> all this?

The VIC HW in Tegra186 is backwards compatible with the one in Tegra210, 
which has open userspace (https://github.com/cyndis/vaapi-tegra-driver), 
so that userspace should remain compatible. The old firmware is not 
compatible so we need a new compatibility string for that.

>
> Thanks, Daniel

Thanks,
Mikko
