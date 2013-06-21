From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V1] ARM: dts: tegra: Modify pcie memory space size
Date: Fri, 21 Jun 2013 00:16:50 -0600
Message-ID: <51C3EFD2.7090803@wwwdotorg.org>
References: <1371712491-31070-1-git-send-email-jagarwal@nvidia.com> <51C32CC7.5010109@wwwdotorg.org> <C79B248886DD134989C8FF6B096A91AB91CF1615EC@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C79B248886DD134989C8FF6B096A91AB91CF1615EC-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Juha Tukkinen <jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Thota <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/20/2013 11:30 PM, Jay Agarwal wrote:
>> On 06/20/2013 01:14 AM, Jay Agarwal wrote:
>>> - decrease non-prefetch memory size to 128 MB
>>> - increase prefetch memory size to 384 MB
>>> - above change is done because most pcie devices
>>>   prefetch memory size requirement is quite higher
>>>   compared to non-prefetch memory space.
>>
>> It's possible this change won't be suitable for all applications. People may
>> simply need to adjust their DT based on what they want to connect.
>> Still, this patch probably biases things in the correct way for now.
>> Longer term, we might want to investigate dynamically sizing the windows
>> in order to support arbitrary attached devices, in much the same way as the
>> Marvell code does/will in order to conserve physical/bus address space for
>> their multiple controllers.
>>
>> However, this change allows me to correctly enumerate a particular GPU I
>> have plugged into my Harmony board, and assign all the BARs, so:
>>
>> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Thierry,
> Could you please integrate this change also to your branch if review is done. Please let me know once it is done.

I'm sure he will, but pinging after less than 24 hours is a little quick.
