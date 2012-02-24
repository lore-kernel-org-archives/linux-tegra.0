From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH] gpio: tegra: Fix build issue due to irq_domain rework.
Date: Fri, 24 Feb 2012 15:12:37 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BCE0C@HQMAIL01.nvidia.com>
References: <1329175275-19404-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1329175275-19404-1-git-send-email-swarren@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Monday, February 13, 2012 4:21 PM:
> Commit 7da5a66 "irq_domain: Remove 'new' irq_domain in favour of the
> ppc one" changed the set of available irq domain APIs. Update the Tegra
> GPIO driver to account for those changes, to solve a build break.

Grant, Linus,

Could this please be checked in; linux-next since about Feb 6th doesn't
build for Tegra without it.

Thanks.

-- 
nvpublic
