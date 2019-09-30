From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 00/14] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Mon, 30 Sep 2019 21:32:51 +0300
Message-ID: <cf27855a-eb85-1a38-3d04-95e7efe06ebf@gmail.com>
References: <20190929175952.22690-1-digetx@gmail.com>
 <20190930082645.GF1518582@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930082645.GF1518582@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.09.2019 11:26, Thierry Reding пишет:
> On Sun, Sep 29, 2019 at 08:59:38PM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series does the following:
>>
>>   1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
>>      into common drivers/cpuidle/ directory.
>>
>>   2. Enables CPU cluster power-down idling state on Tegra30.
>>
>> In the end there is a quite nice clean up of the Tegra CPUIDLE drivers
>> and of the Tegra's arch code in general. Please review, thanks!
> 
> I generally like this series and it looks really good from a diffstat
> point of view. However, removing existing drivers completely and then
> incrementally add a new one make this impossible to review.
> 
> If you think about it, it also makes it really difficult to find what
> went wrong if at any point in the future we find a regression caused by
> the new driver. A bisection will always point at the commit that removes
> the old driver because between that and the point where you add the new
> driver, CPU idle just doesn't work at all anymore.
> 
> While I understand that it's very convenient to just throw away old code
> and rewrite it from scratch, it's also impractical (and a little rude).
> It's not how we do things in the kernel. Unless maybe under specific
> circumstances.
> 
> Can you please try and make this a little more iterative? At the very
> least I'd expect a series where you do all the preliminary work in
> preparatory patches and then replace the old driver by the new driver in
> a single patch. That way at least there will be an unambiguous commit in
> a bisection.
> 
> Ideally, you'd also break up that last conversion patch into smaller
> incremental patches to make it easier for people to review. Remember
> that your chances to attract reviewers increases if you make the patches
> easy to review, which means your patches should be small, logical
> changes that (ideally) are obviously correct.

Thanks for the detailed explanation, probably this is the same what Jon
was asking to do. Now I see what you're are asking for.
