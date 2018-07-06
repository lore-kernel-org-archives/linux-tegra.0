From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 0/5] Initial support of Trusted Foundations on Tegra30
Date: Fri, 6 Jul 2018 15:01:52 +0300
Message-ID: <7c38961f-4ad6-f4b8-7ef1-b43a07353832@gmail.com>
References: <20180619110027.16935-1-digetx@gmail.com>
 <d99935be-797d-4676-c186-a045a590f01b@gmail.com> <11534185.70fb5jbPr6@dimapc>
 <5c47ef70-b90e-6e81-39dd-fbcfad2b93e5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5c47ef70-b90e-6e81-39dd-fbcfad2b93e5@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Geis <pgwipeout@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
List-Id: linux-tegra@vger.kernel.org

Kexec works for me on T30 with the following kernel config options on top of the
tegra_defconfig:

CONFIG_SMP=n
CONFIG_CPU_IDLE=n
CONFIG_TEGRA_IOMMU_SMMU=n

CPU stopping isn't working correctly with the trusted foundations and it's not
obvious what is wrong. I hope we'll fix it at some point.
