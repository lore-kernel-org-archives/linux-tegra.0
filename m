From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH v1 1/2] Add support for Tegra210
Date: Fri, 20 Mar 2015 23:58:23 +0000
Message-ID: <4fd5ea986f834632883b5217811f13c8@HQMAIL103.nvidia.com>
References: <1426546275-6214-1-git-send-email-jimmzhang@nvidia.com>
 <1426546275-6214-2-git-send-email-jimmzhang@nvidia.com>
 <5509BDC8.6020706@wwwdotorg.org>
 <578a1e1ae5fc4b409e295f779a4bed52@HQMAIL103.nvidia.com>
 <550CA3CD.3070600@wwwdotorg.org>
 <3496498eff8144f080686c999ba7c87a@HQMAIL103.nvidia.com>
 <550CB0DD.9080509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550CB0DD.9080509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Oh. Missed again. 

Will make changes in separate patch and submit new v2.

Jimmy

> -----Original Message-----
> From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Stephen Warren
> Sent: Friday, March 20, 2015 4:44 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [cbootimage PATCH v1 1/2] Add support for Tegra210
> 
> On 03/20/2015 05:41 PM, Jimmy Zhang wrote:
> > Missed your email. Will resubmit v2 patch shortly.
> 
> That change can easily be a separate patch to avoid reposting the current
> patches.
> 
> >
> > Jimmy
> >
> >> -----Original Message-----
> >> From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> >> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Stephen Warren
> >> Sent: Friday, March 20, 2015 3:49 PM
> >> To: Jimmy Zhang
> >> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Subject: Re: [cbootimage PATCH v1 1/2] Add support for Tegra210
> >>
> >> On 03/20/2015 04:27 PM, Jimmy Zhang wrote:
> >>> Stephen Warren wrote at Wednesday, March 18, 2015 11:03 AM:
> >>>> On 03/16/2015 04:51 PM, Jimmy Zhang wrote:
> >>>>> use option -t 210 or -s tegra210 to specify t210.
> >>
> >>>>> diff --git a/src/cbootimage.c b/src/cbootimage.c
> >>>>
> >>>>> @@ -71,11 +71,11 @@ usage(void)
> >>>>>     	printf("    -gbct                 Generate the new bct file.\n");
> >>>>>     	printf("    -o<ODM_DATA>          Specify the odm_data(in
> hex).\n");
> >>>>>     	printf("    -t|--tegra NN         Select target device. Must be one
> of:\n");
> >>>>> -	printf("                          20, 30, 114, 124, 132.\n");
> >>>>> +	printf("                          20, 30, 114, 124, 132, 210.\n");
> >>>>
> >>>> Since the option is deprecated, I think we should only support
> >>>> --soc for Tegra210. I won't mention this in any other places that
> >>>> would need to be updated to fix that.
> >>>>
> >>> Ok, it can be removed here. But, the place that actually interprets
> >>> -t option may not worth being changed because both -t and -s run the
> >>> same
> >> code:
> >>
> >> Ah I see. I wonder if we shouldn't remove the text "This option is
> >> deprecated" from the -t option's help text then. If it's that easy to
> >> support, there's no really need to deprecate it.
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe
> >> linux-tegra" in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> More majordomo info at http://vger.kernel.org/majordomo-info.html
> >
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in the
> body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
