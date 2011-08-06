From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the
 suspend_noirq/resume_noirq
Date: Sat, 6 Aug 2011 09:48:05 +0100
Message-ID: <20110806084805.GA18098@sirena.org.uk>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
 <CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 05, 2011 at 09:33:31PM -0700, Colin Cross wrote:

Please delete unneeded context from e-mails, it makes it much easier to
find the content.

> NAK - moving the suspend order around is not the correct way to solve
> this.  If wm8903 needs to talk to the i2c bus in its suspend handler,
> it needs to be child device on the i2c bus.  suspend_noirq is for

WM8903 is an I2C device.  The problem is that it's suspended as part of
the ASoC suspend since the audio subsystem is composed of multiple
devices that all need to work together coherently.  I did start doing
some stuff to bodge around this like we do on probe but there are enough
system wide problems with this that it didn't seem worth the complexity
when the existing workarounds are so straightforward.

> devices that must suspend with system irqs turned off, not for
> ordering suspend handlers.

Unfortunately it's the only tool Linux has for dealing with this sort of
issue right now.  We were supposed to be getting support for telling the
PM core about dependencies but Linus didn't like that, and it's possible
Grant's stuff with allowing device binding to be retried to handle cross 
bus dependencies will help.  Right now the Linux model just doesn't have
any understanding of cross device dependencies other than control buses.

One other example of this is that you're also going to have the same
problem with PMICs - random devices on the system might want to control
their regulators as part of the suspend process and typically the PMIC
is going to be connected over I2C so it needs to be available for as
long as possible.
