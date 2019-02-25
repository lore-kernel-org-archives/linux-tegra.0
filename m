From: Jon Hunter <jonathanh@nvidia.com>
Subject: Regression: SUNRPC: Use poll() to fix up the socket requeue races
Date: Mon, 25 Feb 2019 20:25:21 +0000
Message-ID: <95702994-6762-e42b-06ee-ae945c2137bd@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Trond,

Starting in next-20190222 I have observed a regression with NFS causing
some of our boards to fail to boot. Bisect points to your commit ...

commit 0ffe86f48026b7f34db22d1004bc9992f0db8b33
Author: Trond Myklebust <trond.myklebust@hammerspace.com>
Date:   Wed Jan 30 14:51:26 2019 -0500

    SUNRPC: Use poll() to fix up the socket requeue races


After reverting this on top of -next I no longer see the problem. I have
not had chance to look any closer, but wanted to see if you had any
ideas what might be the problem.

Cheers
Jon
