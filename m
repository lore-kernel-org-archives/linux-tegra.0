From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH REPOST] usb: host: tegra remove include of <mach/iomap.h>
Date: Mon, 29 Oct 2012 11:01:08 -0600
Message-ID: <508EB654.8030502@wwwdotorg.org>
References: <1351106941-869-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351106941-869-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/24/2012 01:29 PM, Stephen Warren wrote:
> Almost nothing from this file is used, and the file will hopefully be
> deleted soon. Copy the tiny portions that are used directly into
> ehci-tegra.c. I believe that Venu Byravarasu is working on cleaning up
> our USB driver, and those cleanups will remove the need for these
> constants.

Per suggestion from Greg, I have applied this to the Tegra tree for 3.8.
