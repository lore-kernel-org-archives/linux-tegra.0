From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 2/6] ARM: tegra: Add chipid, revision and fuse init
Date: Wed, 05 Feb 2014 11:40:49 -0700
Message-ID: <52F285B1.7030802@wwwdotorg.org>
References: <1390952176-30402-1-git-send-email-pdeschrijver@nvidia.com> <1390952176-30402-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1390952176-30402-3-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Joseph Lo <josephl@nvidia.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Danny Huang <dahuang@nvidia.com>, Hiroshi Doyu <hdoyu@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Will Deacon <will.deacon@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Dave Martin <dave.martin@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Alexandre Courbot <acourbot@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Dmitry Osipenko <digetx@gmail.com>, Wolfram Sang <wsa@the-dreams.de>
List-Id: linux-tegra@vger.kernel.org

On 01/28/2014 04:36 PM, Peter De Schrijver wrote:
> All fuse related functionality will move to a driver in the following patches.
> To prepare for this, export all the required functionality in a global header
> file and move all users of fuse.h to tegra-soc.h

The patch subject and description don't appear related to each-other.
