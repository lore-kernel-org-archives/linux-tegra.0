From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: tegra20: Store CPU "resettable" status in IRAM
Date: Mon, 19 Jan 2015 10:45:52 -0700
Message-ID: <54BD42D0.3020107@wwwdotorg.org>
References: <1421319545-23920-1-git-send-email-digetx@gmail.com> <1421319545-23920-2-git-send-email-digetx@gmail.com> <20150119141224.GF23778@ulmo.nvidia.com> <54BD3E3E.2040801@wwwdotorg.org> <54BD41D3.7030703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <54BD41D3.7030703@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/19/2015 10:41 AM, Dmitry Osipenko wrote:
> 19.01.2015 20:26, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hopefully this works out. I suppose it's unlikely anyone will be
>> running code on
>> the AVP upstrem, so any potential conflict with AVP's usage of IRAM
>> isn't likely
>> to occur.
>>
> I don't see how it can conflict with AVP code. First KB of IRAM is
> reserved for reset handler. Am I missing something?
>
>  From reset.h:
>
> /* The first 1K of IRAM is permanently reserved for the CPU reset
> handler */

I believe "CPU" in that context means AVP CPU. Still, I may not be=20
correct, and to be honest it's likely not too well defined even if that=
=20
comment seems clear-cut.

>> __tegra20_cpu1_resettable_status_offset has a lot of _ at the start.
>> Should the
>> symbol be named more normally? I guess at least it's consistent with=
 the
>> existing very "underscory" __tegra_cpu_reset_handler_start.
> I also wasn't happy with "underscory" :) And yes, I left it for
> consistency. Please feel free to rename it, if needed.
