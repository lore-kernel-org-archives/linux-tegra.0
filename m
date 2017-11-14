From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: cros ec: spi: Don't send first message too soon
Date: Tue, 14 Nov 2017 14:44:31 +0000
Message-ID: <1ef0189a-13b1-b35d-27b9-61b5f77a1795@nvidia.com>
References: <1510607140-30582-1-git-send-email-jonathanh@nvidia.com>
 <20171113211900.GA126873@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171113211900.GA126873-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 13/11/17 21:19, Brian Norris wrote:
> + others
> 
> On Mon, Nov 13, 2017 at 09:05:39PM +0000, Jon Hunter wrote:
>> On the Tegra124 Nyan-Big chromebook the very first SPI message sent to
>> the EC is failing.
>>
>> The Tegra SPI driver configures the SPI chip-selects to be active-high
>> by default (and always has for many years). The EC SPI requires an
>> active-low chip-select and so the Tegra chip-select is reconfigured to
>> be active-low when the EC SPI driver calls spi_setup(). The problem is
>> that if the first SPI message to the EC is sent too soon after
>> reconfiguring the SPI chip-select, it fails.
>>
>> The EC SPI driver prevents back-to-back SPI messages being sent too
>> soon by keeping track of the time the last transfer was sent via the
>> variable 'last_transfer_ns'. To prevent the very first transfer being
>> sent too soon, initialise the 'last_transfer_ns' variable after calling
>> spi_setup() and before sending the first SPI message.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Looks like this issue has been around for several Linux releases now
>> and it just depends on timing if this issue is seen or not and so there
>> is no specific commit this fixes. However, would be good to include for
>> v4.15.
> 
> I wonder if that doesn't mean we should have a stable tag still?
> 
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

I was thinking about that as well after I sent it. I have resent as a V2
CC'ing stable.

Cheers
Jon

-- 
nvpublic
