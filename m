From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] mmc: tegra: fix SDR50 tuning override
Date: Fri, 17 Jan 2020 18:41:42 +0300
Message-ID: <dbac86b6-a0b7-cf55-645a-ff0f39b7ae55@gmail.com>
References: <9aff1d859935e59edd81e4939e40d6c55e0b55f6.1578390388.git.mirq-linux@rere.qmqm.pl>
 <CAPDyKFqXmbnH_NWZZTHHCE+Lt-f3JHAhJ8-=aoKNEPyQed44YA@mail.gmail.com>
 <20200117141145.GD26135@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20200117141145.GD26135@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-mmc-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lucas Stach <dev@lynxeye.de>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

17.01.2020 17:11, Michał Mirosław пишет:
> On Thu, Jan 16, 2020 at 03:39:54PM +0100, Ulf Hansson wrote:
>> On Tue, 7 Jan 2020 at 10:47, Michał Mirosław <mirq-linux@rere.qmqm.pl> wrote:
>>>
>>> Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
>>> broke SDR50 tuning override. Use correct NVQUIRK_ name.
>>>
>>> Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
>>> Cc: <stable@vger.kernel.org> # 4f6aa3264af4: mmc: tegra: Only advertise UHS modes if IO regulator is present
>>
>> I am dropping this tag, simply because I don't understand what it should tell.
> 
> It tells the maintainer that he needs to cherry-pick this commit if
> its not in particular stable version already. I guess this is only
> for v4.4, as v4.9+ already have it, and v3.16 does not include the
> Fixed commit.

I guess it could be: Cc: <stable@vger.kernel.org> # v4.4+

And then you could email Greg KH or Sasha Levin, asking to pick up the
additional commit to the stable kernel, or they will ask you by
themselves about why the patch isn't applying and how to handle it.
