From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH cbootimage] Fix assert with help output only
Date: Fri, 12 Apr 2013 13:11:10 -0600
Message-ID: <51685C4E.5060602@wwwdotorg.org>
References: <100595c7fe767c0766358d59896d28f4a1239d82.1365760185.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <100595c7fe767c0766358d59896d28f4a1239d82.1365760185.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/12/2013 03:53 AM, Marc Dietrich wrote:
> This moves an assert down if only "-h" and not SOC is given on the
> command line.

I have applied this.
