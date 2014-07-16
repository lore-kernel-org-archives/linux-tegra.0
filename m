From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [cbootimage PATH V2 RESEND 2/3] Add Tegra132 support for the
 cbootimage utility
Date: Wed, 16 Jul 2014 09:53:39 +0800
Message-ID: <53C5DB23.1080106@nvidia.com>
References: <1405403997-29477-1-git-send-email-vinceh@nvidia.com> <1405403997-29477-2-git-send-email-vinceh@nvidia.com> <20140715234024.GB31327@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140715234024.GB31327-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi
On 07/16/2014 07:40 AM, Allen Martin wrote:
> On Mon, Jul 14, 2014 at 10:59:56PM -0700, Vince Hsu wrote:
>> This patch adds support for Tegra132. This are only slight
>> differences between Tegra124 and Tegra132. The command line
>> usage is exactly the same as other platforms like Tegra124.
>> Two parse items "Mts=" and "MtsPreboot=" are added to embedded
>> MTS images in BCT image like what we do for bootloader.
>>
>> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
> Your subject line said PATH instead of PATCH which caused my mail
> filter to stick this in the wrong bucket :^)
Oops, sorry.
>
> Can you give an example of the syntax for the Mts= and MtsPreboot=
> lines for the record?
The syntax is exactly the same as "Bootloader=".
MtsPreboot = mts_preboot_si,0x40030000,0x40030000,Complete;
Mts = mts_si,0x82000000,0x0,Complete;
The address should be considered specifically though. That might depend 
your board design.
>
> Also, can you give a brief description of the changes you made
> relative to Tegra124 in src/t132/* ?
Will add into commit message.

Thanks,
Vince
