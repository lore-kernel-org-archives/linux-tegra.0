From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Free the IOMMU domain when there is no
 device to attach
Date: Tue, 18 Jul 2017 10:09:45 +0100
Message-ID: <8db74bfc-e442-dd32-4b24-1c33f3a82d92@nvidia.com>
References: <20170710193305.5987-1-contact@paulk.fr>
 <09ecbf74-ac5d-a7f5-c6bd-53f4f84a0de5@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <09ecbf74-ac5d-a7f5-c6bd-53f4f84a0de5-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mikko,

On 11/07/17 07:43, Mikko Perttunen wrote:
> Thanks for the patch, didn't consider this case. I really need to get
> together some system to automatically test on multiple platforms.. :)
We already have the infrastructure in place to do this, however, at the
moment we are just making sure the platforms boot. Something like this
we should be able to catch, even if we don't explicitly test display/hdmi.

I was thinking that we could parse the /dev and /sys file-systems to
ensure that devices for a given platform are present after boot. I am
not sure if there is a good way to do this, but if you have any
thoughts, then I am willing to add more testing.

What is interesting about this case, was that there were no specific
error messages that indicated this had broken AFAICT.

Cheers
Jon

-- 
nvpublic
