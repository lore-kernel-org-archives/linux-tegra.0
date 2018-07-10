From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] memory: tegra: Correct driver probe order
Date: Tue, 10 Jul 2018 15:41:04 +0300
Message-ID: <6928630.1YQN54N9Yp@dimapc>
References: <20180526142035.21741-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180526142035.21741-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Saturday, 26 May 2018 17:20:35 MSK Dmitry Osipenko wrote:
> The Reset Controller should be registered in the end of probe, otherwise
> Memory Controller device goes away if IRQ requesting fails and the Reset
> Controller stays registered. To avoid having to unwind the MC probing in
> a case of SMMU probe failure, let's simply print the error message without
> failing the MC probe. This allows us to just move the Reset Controller
> registering before the SMMU registration, reducing code churning. Also
> let's not fail MC probe in a case of Reset Controller registration failure
> as it doesn't prevent the MC driver to work.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Thierry, this patch should be good to go.
