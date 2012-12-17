From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add EMC clock scaling API
Date: Mon, 17 Dec 2012 12:23:51 +0100
Message-ID: <1355743431.1490.9.camel@tellur>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de>
	 <1355516086-11116-2-git-send-email-dev@lynxeye.de>
	 <50CEFD28.7080601@gmail.com> <50CEFF8B.5030901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50CEFF8B.5030901-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 17.12.2012, 19:18 +0800 schrieb Mark Zhang:
> Sorry forgot one comment: Change the type of variable "bandwidth"(e.g:
> in function "tegra_emc_request_bandwidth") from "int" to "unsigned int"
> or "unsigned long". It's very likely that "bandwidth" exceeds the range
> of type int. Although you use it in correct way but it's better to
> declare it as the right type.
> 
I wouldn't call more than 2GB/s bandwidth for a single client likely,
but yes I'll fix it up.
