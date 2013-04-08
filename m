From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: Boot hang due to "pipe: fold file_operations instances in one"
 in next-20130408
Date: Mon, 8 Apr 2013 22:22:49 +0100
Message-ID: <20130408212249.GT4068@ZenIV.linux.org.uk>
References: <5163346B.5090602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5163346B.5090602@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 08, 2013 at 03:19:39PM -0600, Stephen Warren wrote:
> Al,
> 
> I'm seeing a boot hang on Tegra in next-20130408. Even sysrq on the
> serial console doesn't work, yet I think cpuidle is still running since
> the LED that shows CPU power is flickering.
> 
> git bisect points at commit 9984d73 "pipe: fold file_operations
> instances in one". Reverting
> the-merge-of-the-branch-that-contains-this-patch from next-20130408
> certainly solves the problem; reverting just that one patch is a bit
> painful since it's in the middle of a bunch of other cleanup.
> 
> Do you have any idea what might be wrong? I can't see anything obvious
> in the patch.

What userland do you have?
