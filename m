From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH 1/1] memory: tegra30: Fix warning w/o PM_SLEEP
Date: Wed, 21 Nov 2012 23:45:44 -0700
Message-ID: <50ADCA18.4080004@nvidia.com>
References: <1353501740-25420-1-git-send-email-hdoyu@nvidia.com> <20121121.144727.1842286617829159643.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121121.144727.1842286617829159643.hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "axel.lin@gmail.com" <axel.lin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 11/21/2012 05:47 AM, Hiroshi Doyu wrote:
> From 2257f87f95c3982aac7c30389357db66f597c083 Mon Sep 17 00:00:00 2001
> From: Hiroshi Doyu <hdoyu@nvidia.com>
> Date: Thu, 15 Nov 2012 08:28:39 +0200
> Subject: [PATCH 1/1] memory: tegra30: Fix warning w/o PM_SLEEP
> 
> Fix build warning w/o PM_SLEEP.

Hiroshi,

I'm getting 2 copies of all these patches; a normal-looking patch
followed by what looks like an mbox file in the message body, or
something like that. Also, the patches are all "to" a mailing list, and
"cc" various people, whereas they should usually be "to" the people you
expect to apply the patch, and "cc" any other people and mailing lists.
I'm off work on holidays right now, returning on the 26th and will look
into which of these patches I should/shouldn't be taking myself when I
get back.
