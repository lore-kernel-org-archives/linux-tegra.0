From: Venu Byravarasu <vbyravarasu@nvidia.com>
Subject: RE: [PATCH] usb: phy-tegra-usb.c: wrong pointer check for remap UTMI
Date: Wed, 4 Dec 2013 11:35:52 +0530
Message-ID: <D958900912E20642BCBC71664EFECE3E6E8C7A8C90@BGMAIL02.nvidia.com>
References: <1386122564-4246-1-git-send-email-chris.ruehl@gtsys.com.hk>
 <529EA886.8010508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <529EA886.8010508@wwwdotorg.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Chris Ruehl <chris.ruehl@gtsys.com.hk>, "balbi@ti.com" <balbi@ti.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

Initially Chris sent this patch to Linux-USB alias alone & there I Acked it.
Plz check http://marc.info/?l=linux-usb&m=138475663023376&w=1 

Then he resent the patch to linux-kernel alias with my ACK added.

Thanks,
Venu


> -----Original Message-----
> From: Stephen Warren [mailto:swarren@wwwdotorg.org]
> Sent: Wednesday, December 04, 2013 9:29 AM
> To: Chris Ruehl; balbi@ti.com
> Cc: gregkh@linuxfoundation.org; thierry.reding@gmail.com; linux-
> usb@vger.kernel.org; linux-tegra@vger.kernel.org; linux-
> kernel@vger.kernel.org; Venu Byravarasu
> Subject: Re: [PATCH] usb: phy-tegra-usb.c: wrong pointer check for remap
> UTMI
> 
> On 12/03/2013 07:02 PM, Chris Ruehl wrote:
> > usb: phy-tegra-usb.c: wrong pointer check for remap UTMI
> >
> > A wrong pointer was used to test the result of devm_ioremap()
> >
> > Signed-off-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
> > Acked-by: Venu Byravarasu <vbyravarasu@nvidia.com>
> 
> Out of curiosity, when did that ack happen? I didn't see it. But anyway,
> 
> Acked-by: Stephen Warren <swarren@nvidia.com>
