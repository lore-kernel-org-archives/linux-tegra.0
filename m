From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Naming convention DSI + device tree
Date: Wed, 22 May 2013 14:24:43 +0800
Message-ID: <519C64AB.2090708@gmail.com>
References: <20130514181745.GA2762@mail.o2s.ch> <51940C22.4050802@wwwdotorg.org> <20130516071537.GA13573@mail.o2s.ch> <519522C1.5010107@wwwdotorg.org> <5195C1E2.4020009@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5195C1E2.4020009-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, =?ISO-8859-1?Q?David_Lanzen?= =?ISO-8859-1?Q?d=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Cool. Alex, do you know any updates on DSI part of CDF? I recall few
months ago, Laurent wrote mail to share some infos about the CDF
discussions, and it mentioned that the DSI will be considered in next
version of CDF... you know, for t114, the DSI support is a must.

Mark
On 05/17/2013 01:36 PM, Alex Courbot wrote:
> On 05/17/2013 03:17 AM, Stephen Warren wrote:
>>> Is this upcoming CDF included within your "linux-next_common"
>>> branch?
>>
>> No. That branch of mine is basd on linux-next, so whatever is in
>> linux-next is in my branch, and I certainly haven't applied the CDF
>> locally.
>>
>> I believe the CDF has been posted to various mailing lists a few
>> times, but it isn't checked in yet since there isn't a final version.
>> I CC'd Alex; he might know the status better than me.
> 
> Current version is RFC v2 - I know Laurent is working on a v3, but it is
> taking some time. It will probably differ considerably from v2, so be
> warned if you use it.
> 
> Still, if you want to play around with the CDF, you can have a look at
> the tegra-cdf branch of my github repo:
> https://github.com/Gnurou/linux/commits/tegra-cdf
> 
> It was kind of old so I rebased it on top of 3.10rc1. It includes the
> CDF v2 patch, adds CDF support to the tegra-drm driver, and also
> implements a driver for the Tegra 2-based Ventana panel. It's pretty
> straightforward to read so I guess you can use that as a guide.
> 
> I checked whether the rebase worked and it does - you just need to
> enable host1x/tegradrm support on top of the default settings (Stephen,
> why aren't these enabled by default?)
> 
> So long story short, CDF works well and is small enough to be easy to
> maintain out-of-tree. A proper panel framework is desperately needed in
> the kernel, so I hope it will move forward soon.
> 
> Hope this helps,
> Alex.
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
