From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegra-pinmux-scripts] [PATCH] Add support for Norrin
Date: Mon, 04 Aug 2014 12:47:50 -0600
Message-ID: <53DFD556.3010707@wwwdotorg.org>
References: <1406846532-12611-1-git-send-email-amartin@nvidia.com> <53DACE72.2060602@wwwdotorg.org> <53DBEE51.1060102@wwwdotorg.org> <20140804183544.GA30474@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140804183544.GA30474-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/04/2014 12:35 PM, Allen Martin wrote:
> On Fri, Aug 01, 2014 at 12:45:21PM -0700, Stephen Warren wrote:
>> On 07/31/2014 05:17 PM, Stephen Warren wrote:
>>> On 07/31/2014 04:42 PM, Allen Martin wrote:
>>>> Add support for Tegra124 Norrin FFD reference board (PM370).  Pinmux
>>>> is based on PM370_T124_customer_pinmux_1.1 spreadsheet.
>>>
>>> Oh good; I guess the Excel spreadsheet format was similar enough to
>>> Jetson TK1 and Venice2 so no changes were required to
>>> csv-to-board-tegra124-xlsx.py other than adding the board name. That's
>>> good news:-)
>>
>> Oh, I see I have the changes below in my local tree from when I was
>> fiddling with adding Norrin to tegra-pinmux-scripts. Are you sure you
>> don't need those?
>
> Not any more, I filed a bug on the original pinmux spreadsheet because
> it was more than just the GPIOs that were wrong, when that got fixed
> the spreadsheet works fine without any of the other changes to the
> script.

Ah great! I've applied the patch upstream.
