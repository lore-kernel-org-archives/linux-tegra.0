From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFC PATCH] irqchip: arm-gic: take gic_lock when updating irq
 type
Date: Thu, 22 Mar 2018 12:19:15 +0000
Message-ID: <77ac9d88-e99e-c507-66b2-cc14f06ce192@arm.com>
References: <c20f41d47ed9444b9050bc1f609d4bbe@bgmail101.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c20f41d47ed9444b9050bc1f609d4bbe@bgmail101.nvidia.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Aniruddha Banerjee <aniruddhab@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, Vipin Kumar <vipink@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 22/03/18 10:28, Aniruddha Banerjee wrote:

[a PGP-encrypted email]

Given that you're cc-ing various mailing lists, please resend this email
unencrypted.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
