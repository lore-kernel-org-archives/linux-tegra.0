From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Mon, 6 Apr 2020 23:28:51 +0300
Message-ID: <1c2c921e-daef-ba0f-5d1a-b58aa0b940fb@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <38d921a7-5cdf-8d0a-2772-4399dd1a96a0@gmail.com>
 <9b8cf37b-d2ad-9df2-aad8-216c2c954e69@nvidia.com>
 <1a12974a-7cc7-2c3a-3995-076b9956714d@gmail.com>
 <66cc8646-43d3-3fc8-c31d-d0d2efac505f@nvidia.com>
 <f000f6b9-0f05-b2a5-6dad-37b09803711d@gmail.com>
 <fe6a17c1-fae2-a365-4dd6-6d3a25d47d54@nvidia.com>
 <9038ce90-ac53-93e7-ce65-57f6ff1e9b30@nvidia.com>
 <abe82fd1-0464-0627-6c97-39c896e53dd0@gmail.com>
 <36b5627a-8639-6244-8620-4f23828e0638@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36b5627a-8639-6244-8620-4f23828e0638-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

06.04.2020 23:05, Sowjanya Komatineni пишет:
..
>>> Wait time for HW syncpt to reach threshold is tuned to work for all
>>> frame rates. So if increment doesn't happen by then, its definitely
>>> missed event.
>> This is questionable. Technically, speculating about whether the tuned
>> value is good for all possible cases is incorrect thing to do.
>>
>> Although, I guess in practice it should be good enough for the starter
>> and could be improved later on, once the host1x driver will be improved.
> 
> By tuned value I meant about 200ms wait timeout for frame event to
> happen is what we have been using in downstream and with BSP release
> images which works good for all sensors and bridges we supported so far.

I don't know anything about the state of today's downstream, but
downstream of older Tegra SoCs was pretty awful in regards to the host1x
syncing, unfortunately it was borrowed into the upstream host1x years
ago and nothing was done about it so far. I'd suggest to be careful
about it.
