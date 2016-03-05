From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v1 4/4] Increate USB timeout value
Date: Sat, 5 Mar 2016 02:39:38 +0000
Message-ID: <f4e73413aa8c42b1baf803daf5a7506f@HQMAIL103.nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-5-git-send-email-jimmzhang@nvidia.com>
 <20160305014644.GC19189@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160305014644.GC19189-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Allen Martin
> Sent: Friday, March 04, 2016 5:47 PM
> To: Jimmy Zhang
> Cc: Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH v1 4/4] Increate USB timeout value
> 
> On Fri, Mar 04, 2016 at 03:44:47PM -0800, Jimmy Zhang wrote:
> > It has been observed that some times USB time out could occure when a
> > long (3ft) usb cable is connected to recovery mode usb port
> >
> 
> How about making it a command line argument instead, so next time
> someone tries a 6ft cable we don't need another patch? :^)
> 
Agree. Will make a change.

> -Allen
