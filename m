From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.14 41/60] PCI: tegra: Enable Relaxed Ordering
 only for Tegra20 & Tegra30
Date: Fri, 19 Jul 2019 09:31:44 -0400
Message-ID: <20190719133144.GE4240@sasha-vm>
References: <20190719041109.18262-1-sashal@kernel.org>
 <20190719041109.18262-41-sashal@kernel.org>
 <838a6940-2a37-b91b-d522-8b154f3c71d7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <838a6940-2a37-b91b-d522-8b154f3c71d7@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Vidya Sagar <vidyas@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 19, 2019 at 09:33:11AM +0100, Jon Hunter wrote:
>Hi Lorenzo,
>
>We have not requested that this is added to stable yet, however, has
>been picked up. Do we wish to let it soak in mainline for a release
>first? If so maybe we can ask Sasha to drop this for now.

Note that there are about two weeks between this mail and the point
where it actually appears in a stable tree.

AUTOSEL patches follow a much slower pace than ones marked for stable
exactly for the reason you've mentioned.

--
Thanks,
Sasha
