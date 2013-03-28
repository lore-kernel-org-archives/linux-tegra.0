From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] clk: tegra: set up audio clocks on Tegra114
Date: Thu, 28 Mar 2013 09:12:32 -0600
Message-ID: <51545DE0.9090305@wwwdotorg.org>
References: <1364311811-4367-1-git-send-email-swarren@wwwdotorg.org> <20130328150526.GX18519@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130328150526.GX18519-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/28/2013 09:05 AM, Peter De Schrijver wrote:
> On Tue, Mar 26, 2013 at 04:30:11PM +0100, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This sets up all the audio-related clocks on Tegra114 in the same way
>> as they are set up on previous chips.

>> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c

>> +	{pll_a, clk_max, 564480000, 1},
>> +	{pll_a_out0, clk_max, 11289600, 1},
>> +	{extern1, pll_a_out0, 0, 1},

Yes, those are needed. At present, the audio clock code explicitly
disables and enables each of those 3 clocks, and assumes they're enabled
when the driver starts.

Eventually this should probably be changed, but I'd like to get all 3
chips operational with the CCF first, and then change the audio driver
later.
