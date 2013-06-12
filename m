From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Wed, 12 Jun 2013 12:50:02 +0200
Message-ID: <20130612105002.GA1940@manwe>
References: <1370680435.24531.12.camel@localhost.localdomain>
 <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de>
 <1370707552.1829.4.camel@antimon.fritz.box>
 <2572002.IOA8y0azF4@ax5200p>
 <1370767921.2283.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1370767921.2283.8.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jun 9, 2013 at 10:52 AM, Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org> wrote:
[...]
> oops! I think everthing did always work correctly! But somehow Fedora 19
> fails to spawn a getty on the tty1/fb0 console... so I just did see a
> black screen :-)

Just to confirm. This isn't a tegra-drm issue, but rather Fedora 19 not
spawning getty? Or is something in tegra-drm causing getty to fail? That
would be surprising, but I'm trying to figure out if I need to
investigate or not. =)

Thierry
