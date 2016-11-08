From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Tue, 8 Nov 2016 09:49:27 -0700
Message-ID: <08947785-2e7f-0117-2392-b6b1a774bbb8@wwwdotorg.org>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <CACRpkdZpPHLDGeBb8kb=LYmuT0PKPf_quK+OF2peaV+8dxr5vQ@mail.gmail.com>
 <20161107132127.GE12559@ulmo.ba.sec>
 <CAOesGMgJUepmq2JTT7imKh74BsnGobcpBWFuNp94WnX1WtzEjA@mail.gmail.com>
 <20161108155548.GC2244@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161108155548.GC2244@ulmo.ba.sec>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Olof Johansson <olof@lixom.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 11/08/2016 08:55 AM, Thierry Reding wrote:
> On Mon, Nov 07, 2016 at 05:42:33PM -0800, Olof Johansson wrote:
>> On Mon, Nov 7, 2016 at 5:21 AM, Thierry Reding <thierry.reding@gmail.com> wrote:
>>> On Mon, Nov 07, 2016 at 08:53:37AM +0100, Linus Walleij wrote:
>>>> On Wed, Nov 2, 2016 at 11:48 AM, Suresh Mangipudi <smangipudi@nvidia.com> wrote:
>>>>
>>>>> Add GPIO driver for T186 based platforms.
>>>>> Adds support for MAIN and AON GPIO's from T186.
>>>>>
>>>>> Signed-off-by: Suresh Mangipudi <smangipudi@nvidia.com>
>>>>
>>>> Stephen/Thierry/Alexandre:
>>>> Can I get your review on this Tegra thing?
>>>
>>> Can we hold off on this for a bit? I've got my own implementation of
>>> this in my Tegra186 tree because I thought nobody else was working on
>>> it. From a brief look they seem mostly similar but there are a couple
>>> of differences that I need to take a closer look at (and do some more
>>> intensive testing on).
>>
>> Be careful about discouraging other developers internally from
>> participating upstream, Thierry.
>
> That was certainly not my intention. I do welcome any contributions,
> internal or external.
>
>> Please don't become a bottleneck for your company's contributions.
>> Rewriting stuff on your own isn't a scalable model.
>
> Like I said, I didn't rewrite this, I merely wrote the GPIO driver
> because there wasn't one at the time and I wasn't aware of anyone else
> working on one. Waiting for a GPIO driver to emerge would've prevented
> me from making progress on other fronts.

One issue here is that there are lots of patches destined for upstream 
in your own personal tree, but they aren't actually upstream yet. I 
think pushing more of your work into linux-next (and further upstream) 
faster would help people out. linux-next and other "standard" repos 
should be easily discoverable by anyway following any upstreaming 
HOWTOs, but those HOWTOs aren't going to mention your personal trees, so 
patches there effectively don't exist. Making the already extant work 
more discoverable will help prevent people duplicating work.

Related to this, I've been waiting rather a while for the Tegra186 DT 
binding patches I sent to be applied. I'd love to see them go in ASAP 
even if there's no kernel driver behind them. The bindings have been 
reviewed, ack'd, and they're in use in U-Boot already.

A thought on Tegra186: For a older supported SoCs, we obviously don't 
want to push changes upstream that aren't too well baked. However, for a 
new SoC that doesn't work yet, I'm tend to prioritize getting as much 
early work upstream as fast as possible (to try and unblock people 
working in other areas) over getting those patches perfect first. 
Release early, release often will help unblock people and parallelize 
work. Pipeline your own work rather than batching it all up to release 
at once.

P.S. don't take this email too personally or anything; I'm not trying to 
be complaining/critical or anything like that. It's just a few mild 
thoughts.
