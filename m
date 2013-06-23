From: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Sun, 23 Jun 2013 13:54:16 +0000 (UTC)
Message-ID: <loom.20130623T154603-934@post.gmane.org>
References: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Chris Desjardins <chris.desjardins@...> writes:

> 
> 
> Signed-off-by: Chris Desjardins <chris.desjardins@...>
> ---


I just wanted to say a couple of things about this patch:
1) Ethernet is pretty flaky, it works, but when you really start to put a 
heavy load on it the e1000e driver starts saying that the adapter has reset.
2) There is some stuff missing for sure, and probably there is some stuff 
that is not correct, but this is a starting point to just get the board 
running with a mainline kernel. 

Thanks,
    Chris D.
