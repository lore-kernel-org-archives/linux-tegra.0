From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v10 0/7] Support Trusted Foundations firmware on Tegra30
Date: Wed, 3 Apr 2019 13:43:09 +0300
Message-ID: <2e3d45c9-c31b-e7e3-74f3-b0e8fb767c1f@gmail.com>
References: <20190317225211.23091-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190317225211.23091-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.03.2019 1:52, Dmitry Osipenko пишет:
> Hello,
> 
> This patchset adds support for the Trusted Foundations firmware on
> NVIDIA Tegra30. Pretty much all of Tegra30 consumer devices have that
> firmware and upstream kernel can't boot on those devices without the
> firmware support. This series was tested on Nexus 7, TF300T and Ouya
> Tegra30 devices.

Russell, could you please give yours ACK to the firmware patches so that Thierry could pick up the patchset to the Tegra's tree? Alternatively we may take your silence as an implicit ACK and move on if you won't answer.
