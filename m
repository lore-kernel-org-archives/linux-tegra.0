From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH stable] ARM: tegra: unify Tegra's Kconfig a bit more
Date: Mon, 14 Oct 2013 11:11:29 -0700
Message-ID: <525C33D1.4080509@nvidia.com>
References: <1380917411-25869-1-git-send-email-swarren@wwwdotorg.org> <20131005233833.GA18223@kroah.com> <52525247.9060609@nvidia.com> <52539F98.2030307@nvidia.com> <20131010231135.GF4301@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131010231135.GF4301-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Greg,

On 10/10/2013 04:11 PM, Greg KH wrote:
> On Mon, Oct 07, 2013 at 11:00:56PM -0700, Paul Walmsley wrote:
>
>> Well, here's a public link for it:
>>
>> http://nvt.pwsan.com/pub/linux-stable/testlogs/
>>
>> So far it's seeded with v3.11.[34].  It should update automatically
>> as new releases come out.  So far the tests are quite basic (build +
>> boot to minimal userspace).  Please let Stephen and I know if you
>> have any comments or suggestions.
> That's great to see.  Testing the -rc stable releases would be great, to
> find if I break anything, as I don't have Tegra hardware to test them
> out on.

Could you point out the -rc stable releases that you're referring to?  
Took a look at the linux-stable.git and stable-queue.git trees but was 
unsure what matched that description.

Would this be something like applying the queue-* patches and testing on 
a nightly basis?

- Paul
