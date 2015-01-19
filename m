From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] ARM: tegra20: Store CPU "resettable" status in IRAM
Date: Mon, 19 Jan 2015 21:00:06 +0300
Message-ID: <54BD4626.70902@gmail.com>
References: <1421319545-23920-1-git-send-email-digetx@gmail.com> <1421319545-23920-2-git-send-email-digetx@gmail.com> <20150119141224.GF23778@ulmo.nvidia.com> <54BD3E3E.2040801@wwwdotorg.org> <54BD41D3.7030703@gmail.com> <54BD42D0.3020107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54BD42D0.3020107@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.01.2015 20:45, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 01/19/2015 10:41 AM, Dmitry Osipenko wrote:
>> 19.01.2015 20:26, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Hopefully this works out. I suppose it's unlikely anyone will be
>>> running code on
>>> the AVP upstrem, so any potential conflict with AVP's usage of IRAM
>>> isn't likely
>>> to occur.
>>>
>> I don't see how it can conflict with AVP code. First KB of IRAM is
>> reserved for reset handler. Am I missing something?
>>
>>  From reset.h:
>>
>> /* The first 1K of IRAM is permanently reserved for the CPU reset
>> handler */
>
> I believe "CPU" in that context means AVP CPU. Still, I may not be co=
rrect, and
> to be honest it's likely not too well defined even if that comment se=
ems clear-cut.
>
Hmm... Suddenly I recalled that LP2 was always disabled in downstream k=
ernel. I=20
remember that I tried it once (couple years ago) and it didn't work, ho=
wever I=20
presume it was just broken. Now I don't feel good with it.

--=20
Dmitry
