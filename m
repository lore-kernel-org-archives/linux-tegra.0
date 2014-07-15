From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [cbootimage PATH V2 RESEND 2/3] Add Tegra132 support for the
 cbootimage utility
Date: Tue, 15 Jul 2014 16:40:24 -0700
Message-ID: <20140715234024.GB31327@nvidia.com>
References: <1405403997-29477-1-git-send-email-vinceh@nvidia.com>
 <1405403997-29477-2-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405403997-29477-2-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 14, 2014 at 10:59:56PM -0700, Vince Hsu wrote:
> This patch adds support for Tegra132. This are only slight
> differences between Tegra124 and Tegra132. The command line
> usage is exactly the same as other platforms like Tegra124.
> Two parse items "Mts=" and "MtsPreboot=" are added to embedded
> MTS images in BCT image like what we do for bootloader.
> 
> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 

Your subject line said PATH instead of PATCH which caused my mail
filter to stick this in the wrong bucket :^)

Can you give an example of the syntax for the Mts= and MtsPreboot=
lines for the record?

Also, can you give a brief description of the changes you made
relative to Tegra124 in src/t132/* ?

-Allen

nvpublic
