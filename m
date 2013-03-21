From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: add ac97 controller clock
Date: Thu, 21 Mar 2013 11:48:38 -0600
Message-ID: <514B47F6.9050005@wwwdotorg.org>
References: <1359325055-5160-1-git-send-email-dev@lynxeye.de>  <1359325055-5160-2-git-send-email-dev@lynxeye.de>  <5106CE6D.9030008@wwwdotorg.org> <1359401144.1558.11.camel@tellur>  <5106EB03.6080606@wwwdotorg.org>  <20130130093525.GC2364@tbergstrom-lnx.Nvidia.com>  <51096618.3000100@wwwdotorg.org> <1363874463.1846.2.camel@antimon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363874463.1846.2.camel@antimon>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/21/2013 08:01 AM, Lucas Stach wrote:
> Am Mittwoch, den 30.01.2013, 11:27 -0700 schrieb Stephen Warren:
>> On 01/30/2013 02:35 AM, Peter De Schrijver wrote:
>>>>
>>>>> and also ac97 clock == pll_a_out0, so you can
>>>>> just as well use the pll out in that case.
>>>>
>>>> I suspect that "ac97 clock == pll_a_out0" isn't categorically true; it's
>>>> quite possible that the TRM simply doesn't document the mux
>>>> register/field for the ac97 clock since the ac97 module is considered
>>>> deprecated. The diagram at the end of section 5.2.3 "Audio Clocks"
>>>> certainly implies that all of the i2s*, spdifout, and ac97 clocks have
>>>> the same structure.
>>>
>>> It indeed does, but I can't find any reference to a mux control register for
>>> ac97 in any document...
>>
>> For both these two issues, I'll try and track down the relevant HW
>> engineers or other sources of documentation internally...
>>
> Ping.
> I would really like to see those two patches in 3.9, as otherwise
> Colibri T20 boots up with kernel warnings and a non-functional audio.

Sorry, I seem to have forgotten about this, and it looks like I wasn't
able to get any kind of answer from HW. I expect it's far too late to
get this into 3.9.

I guess we can go ahead and add the clock without actually resolving
these issues; I don't think their resolution would affect the device
tree at all, so there should be no compatibility issues to worry about.

I suggest reposting to Mike Turqette (clock maintainer) to see if he'll
take it as a fix for 3.9, or ack it so I can. If not, if he can ack it,
I'll take it for 3.10 along with the Tegra clock driver changes.
