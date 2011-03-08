From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/3] Harmony PCI-e and regulators
Date: Tue, 8 Mar 2011 10:06:28 -0800
Message-ID: <AANLkTikZhz93EEjGov7MDa7tedMNvf05YavQD1ny2H8F@mail.gmail.com>
References: <cover.1299588456.git.mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1299588456.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Mar 8, 2011 at 4:58 AM, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wrote:
> These patches provide update for Harmony PCI-e intialization and add
> registration of the TPS65862 PMIC.
> Additionally, there are several tegra_defconfig updates. These updates
> allow booting the Harmony with PCI-e enabled and add ability to boot
> TrimSlice with root on NFS.
>
> The patches were generated vs. Olof's board-for-next-i2c that seems to
> disappear. If there are now objection to these patches I can push them
> into separate branch in my tree, so that it can be pulled after Tegra
> I2C is merged.

Given the discussion yesterday, I merged what was essentially in the
-i2c branch into the regular boards-for-next branch. I can take these
through the same branch, since Colin hasn't pulled yet.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
