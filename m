From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Add the Tegra210-smaug board
Date: Thu, 7 Apr 2016 16:35:55 -0400
Message-ID: <5706C4AB.4000108@nvidia.com>
References: <1459978380-8574-1-git-send-email-rklein@nvidia.com>
 <5706C36E.6090305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5706C36E.6090305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 4/7/2016 4:30 PM, Stephen Warren wrote:
> On 04/06/2016 03:33 PM, Rhyland Klein wrote:
>> Tegra210-smaug is the name for the Google Pixel C platform.
> 
> I assume tegra210-smaug.dts is the DT filename that will appear in the 
> mainline kernel, and the board name that will appear in U-Boot if U-Boot 
> gets ported? In the past there have been disconnects between what Google 
> wanted to call boards and what NVIDIA called boards. I'd like to avoid 
> applying this and having to renaming everything later, if possible.

Tegra210-smaug is the chosen kernel dt name for this board. That was
approved by Google before posting to the kernel. I believe therefore
that we should be fine to expect that name to be consistent between
kernel/uboot/etc.

> 
> Does this table content match the production SW stack, and our Excel 
> pinmux spreadsheet?

Right now this matches the production SW stack. It has some variances
with the latest Excel pinmux spreadsheets, and I am working on trying to
verify that these are correct vs those, or vice-versa.

> 
> If so, I'll apply this.
> 
> If not, it would be good to at least document what the differences are, 
> and hopefully track down why they exist and get our spreadsheet updated 
> to match the production SW or vice-versa.

Already working on tracking down differences with the spreadsheets and
making sure we have the most correct version we have (and that
appropriate spreadsheets get updated to reflect these settings).

I'll post a v2 when I can get a final answer with either changes
required or notes describing the differences.

-rhyland
-- 
nvpublic
