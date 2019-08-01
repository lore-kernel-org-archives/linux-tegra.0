From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 10/20] clk: tegra: clk-dfll: Add suspend and resume
 support
Date: Thu, 1 Aug 2019 10:53:21 -0700
Message-ID: <0dbc6d22-486c-8b45-bae1-b5ce4efdc370@nvidia.com>
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com>
 <1564607463-28802-11-git-send-email-skomatineni@nvidia.com>
 <4400ffef-685f-b9e6-3b07-4790f851282c@gmail.com>
 <501a9d0e-ce78-9b35-642d-dff7f9223926@gmail.com>
 <BYAPR12MB3398C388471BC5811614C8FEC2DE0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <31990250-e237-ddb9-ce71-29b7c2302fc3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <31990250-e237-ddb9-ce71-29b7c2302fc3@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jui Chang Kuo <jckuo@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, Sandipan Patra <spatra@nvidia.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.>
List-Id: linux-tegra@vger.kernel.org


On 8/1/19 10:10 AM, Dmitry Osipenko wrote:
> 01.08.2019 19:10, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> I didn=E2=80=99t updated any patches. This is still same v7 just resent =
with
>> CPUFreq maintainers in CC as I missed to add them earlier.
> There are now two different threads for the same patches, which is not
> very good. When I said that CPUFreq maintainers should be CC'ed, I
> didn't mean to resend it all, sorry for not being clear about it. You
> should've wait for more comments to the original patches and then make a
> v8. I suggest to do the same in the current situation as well, please
> address all the current comments and wait for 1-2 days, then make a v8.

Thought version bump is only when changes were made. Got it now.

Thanks Dmitry. Sure, will give some time for all feedbacks before=20
sending V8.
