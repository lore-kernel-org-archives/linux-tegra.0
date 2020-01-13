From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 4/8] i2c: tegra: Support atomic transfers
Date: Tue, 14 Jan 2020 01:52:12 +0300
Message-ID: <86f71bfe-7d17-0bf4-edda-13c84301a598@gmail.com>
References: <20200112171430.27219-1-digetx@gmail.com>
 <20200112171430.27219-5-digetx@gmail.com> <20200113220315.GB2689@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20200113220315.GB2689@ninjato>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.01.2020 01:03, Wolfram Sang пишет:
> On Sun, Jan 12, 2020 at 08:14:26PM +0300, Dmitry Osipenko wrote:
>> System shutdown may happen with interrupts being disabled and in this case
>> I2C core rejects transfers if atomic transfer isn't supported by driver.
> 
> Well, not quite. The core complains about it nowadays, but does not
> reject messages. It will try the same behaviour as before. It will just
> inform the user that somethings is tried which may not work. I probably
> should update the error message printed saying that the transfer is
> still tried.

Indeed, now I'm recalling noticing that the transfer actually should
happen despite of the error message, but then completely forgot to
update the commit's message. I can update the message and send out v5,
if you're thinking that it's worthwhile to do.

>> There were several occurrences where I found my Nexus 7 completely
>> discharged despite of being turned off and then one day I spotted this in
>> the log:
> 
> Given my reasoning above, that should have happened before the warning
> was printed as well? Because same behaviour. I'd be surprised if there
> was a change...

Pretty sure that it was happening before, but I wasn't paying much
attention back then.
