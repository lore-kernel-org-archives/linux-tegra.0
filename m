From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/3 v3] usb: tegra20-ehci: Add devicetree support.
Date: Wed, 20 Jul 2011 20:42:16 -0700
Message-ID: <CAOesGMg5U=vPnE+99TPMGMsdwUBriFtfUwajTvBA5wPZzVpfVw@mail.gmail.com>
References: <1311218619-11174-1-git-send-email-achew@nvidia.com>
	<CAOesGMizAxjcNUBPCeeVgYEbLZB4P+0znua7TjhbqUNn91hgGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMizAxjcNUBPCeeVgYEbLZB4P+0znua7TjhbqUNn91hgGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: achew@nvidia.com
Cc: grant.likely@secretlab.ca, swarren@nvidia.com, dwillemsen@nvidia.com, rklein@nvidia.com, mogantyv@nvidia.com, devicetree-discuss@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 20, 2011 at 8:41 PM, Olof Johansson <olof@lixom.net> wrote:
>> +static struct tegra_utmip_config utmi_default = {
>
> __initdata, no need to keep this around after setup.


Oops, I meant __devinitdata.


-Olof
