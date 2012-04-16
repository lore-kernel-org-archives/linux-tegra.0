From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [RFC PATCH] cpuidle: allow per cpu latencies
Date: Mon, 16 Apr 2012 18:34:56 +0300
Message-ID: <20120416153456.GB514@tbergstrom-lnx.Nvidia.com>
References: <1333619620-21201-1-git-send-email-pdeschrijver@nvidia.com>
 <4F7DA009.4010802@linux.intel.com>
 <CAMQu2gzwe0F3qcaTqASEPUASdG1SjpUxrBrSp-RrYLgy3W24OQ@mail.gmail.com>
 <4F7F0D52.8080305@linaro.org>
 <20120410102857.GA22721@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120410102857.GA22721@tbergstrom-lnx.Nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@ti.com>, Len Brown <len.brown@intel.com>, Trinabh Gupta <g.trinabh@gmail.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Deepthi Dharwar <deepthi@linux.vnet.ibm.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arjan van de Ven <arjan@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org

> 
> Maybe we also want to make the 'disabled' flag per CPU then or provide some
> other way the number of C states can be different per CPU?

What do you think about this? Do we also want to make the disabled flag per
CPU? Or how should we deal with a different number of C states per CPU?

Thanks,

Peter.
