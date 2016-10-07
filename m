From: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Subject: Jetson TK1: Additional SPI chip selects
Date: Fri, 7 Oct 2016 15:25:55 +0200
Message-ID: <c35c4309-9432-a9a9-0677-3c2b18202e4f@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tobias Kottwitz <tobias.kottwitz-3hJwHgKweOl99bV2EpccEXqWYbMAw+HU@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

I'm running a Jetson TK1 on mainline Linux. To enable userspace SPI, I
modified the device-tree by:

 /* Expansion TS_SPI_* */
 spi@7000d400 {
 	status = "okay";
+ 	spidev@0 {
+		compatible = "spidev";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+	};
 };

This works fine. Is it possible to use arbitrary GPIOs as additional
chip-selects?

What would I have to do If I'd like to add PU0 or PU1 (sysfs
gpio160/161) as chip-selects?

Anything helps!

Cheers
  Ralf
