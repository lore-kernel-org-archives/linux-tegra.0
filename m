From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-uboot-flasher-scripts] README: use full file names
 for default.xml and default-notools.xml
Date: Tue, 11 Jun 2013 11:34:21 -0600
Message-ID: <51B75F9D.1050809@wwwdotorg.org>
References: <1370971782-25735-1-git-send-email-aplattner@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370971782-25735-1-git-send-email-aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/11/2013 11:29 AM, Aaron Plattner wrote:
> Passing 'default' or 'default-notools' to repo init's -m parameter fails because
> the manifests are actually called 'default.xml' and 'default-notools.xml'
> respectively.

Thanks, applied.

I guess I didn't notice this, since I used default.xml and hence didn't
supply any -m option at all.
