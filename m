From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: tegra: Add clock and reset names for audio
 powergate
Date: Tue, 2 Aug 2016 19:43:41 +0100
Message-ID: <4a793df3-3ac1-9300-62fd-cd628dc47879@nvidia.com>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
 <1470134069-12178-5-git-send-email-jonathanh@nvidia.com>
 <20160802141833.GB20134@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160802141833.GB20134@leverpostej>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 02/08/16 15:18, Mark Rutland wrote:
> On Tue, Aug 02, 2016 at 11:34:29AM +0100, Jon Hunter wrote:
>> Add the clock and reset names for the Tegra210 Audio powergate. Please
>> note that these are not currently used, but added from completeness and
>> to be consistent with the other powergate nodes.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>
>> We added the clock and resets names for the XUSB partitions and so I
>> thought we should do the same for the Audio. Should I update the binding
>> documentation to say these should be provided? Currently it does not
>> state these are required. If we do update the binding doc, I was not
>> entirely sure what to put in the description for these properties.
>> Typically the clock and reset names would be fixed for a device, but here
>> we are not using them and so there are no fixed names.
> 
> The names are there for the consumer's benefit, so if the consumer
> binding doesn't require specific names, they shouldn't be in the DT.
> It doesn't make sense to have names which are not fixed from the
> consumer's PoV, so if anything the above is an argument for *removing*
> the unnecessary and varied names from other nodes.

Yes I was not sure if this correct. We could always add the names at a
later stage if they are needed.

Thierry, do you still want to have the names present? If not, then I can
remove those for xusb.

Cheers
Jon

-- 
nvpublic
