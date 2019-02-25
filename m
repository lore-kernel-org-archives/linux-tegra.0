From: Robert Yang <decatf@gmail.com>
Subject: Re: [PATCH v6 0/7] Support Trusted Foundations firmware on Tegra30
Date: Mon, 25 Feb 2019 11:58:36 -0500
Message-ID: <20190225165836.GA12933@r>
References: <20190222193426.10747-1-digetx@gmail.com>
 <20190225040232.GA2242@qmqm.qmqm.pl>
 <20190225082155.1163ed85@dimatab>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190225082155.1163ed85@dimatab>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 25, 2019 at 08:21:55AM +0300, Dmitry Osipenko wrote:
> В Mon, 25 Feb 2019 05:02:33 +0100
> Michał Mirosław <mirq-linux@rere.qmqm.pl> пишет:
> 
> > On Fri, Feb 22, 2019 at 10:34:19PM +0300, Dmitry Osipenko wrote:
> > > Hello,
> > > 
> > > This patchset adds support for the Trusted Foundations firmware on
> > > NVIDIA Tegra30. Pretty much all of Tegra30 consumer devices have
> > > that firmware and upstream kernel can't boot on those devices
> > > without the firmware support.  
> > 
> > Hi Dmitry
> > 
> > I've applied and tested this patchset on my TF300T. Boots and
> > suspends/wakes using 'rtcwake -m mem -s 1 -d /dev/rtc1' as the test.
> > dmesg attached.
> > 
> > The exact tree used:
> > 	git://rere.qmqm.pl/linux tf300t
> > 
> > Feel free to add my Tested-by and Signed-off-by on the patches where
> > apropriate, and thanks for your work!
> 
> Awesome, thank you very much!
> 
> Robert, could you please confirm that v6 works for you too?
> 

Yes, v6 works on Ouya.

LP1/LP2 suspend tested with 'rtcwake -m mem -s 5'
cpuidle LP2 tested with 'echo 0 | tee /sys/devices/system/cpu/cpu[1-3]/online'
Tested with CONFIG_SMP disabled too.

You can add my Tested-by to this patch set.

> I'll probably make a v7 with an extra minor clean up and then will add
> all the appropriate tags to the patches.
