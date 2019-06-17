From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
Date: Mon, 17 Jun 2019 15:16:13 +0300
Message-ID: <3f5adcda-49e3-46b3-9881-bc33532db4df@gmail.com>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
 <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
 <20190615045405.GA1023@kunai>
 <69a9a7e3-f885-b6ab-60bb-a1165ce2db23@gmail.com>
 <20190617070259.GA30126@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617070259.GA30126@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Bitan Biswas <bbiswas@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

17.06.2019 10:02, Thierry Reding пишет:
> On Sun, Jun 16, 2019 at 04:56:06PM +0300, Dmitry Osipenko wrote:
>> 15.06.2019 7:54, Wolfram Sang пишет:
>>>
>>>>> Without a maintainer ack, this is an exception this time. Should we add
>>>>> Dmitry as another maintainer or reviewer at least?
>>>>>
>>>> I shall followup with Maintainer for ACK in future I2C tegra patches.
>>>
>>> This comment was not directed at you, sorry if that was not clear. It
>>> was more for Laxman, Thierry, Jonathan, and Dmitry (if he is
>>> interested).
>>>
>>
>> I don't mind at all to review and test patches for the driver and can propose myself
>> as a reviewer if that helps and if there are no objections from the Tegra maintainers.
>> My primary interest is to have my devices working after next kernel update, but I also
>> like to review patches in general if they are touching area that I'm familiar with.
> 
> No objection from me.

Thanks! I guess the same from Laxman and Jon?

I'll prepare the patch to add myself as a reviewer.
