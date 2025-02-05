Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591B9193436;
	Wed,  5 Feb 2025 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777019; cv=none; b=YkANPSO8JJIXK8g7+cckLgVFR3vb8ilv7IFs65F56Dvn5UWcl8oOZ6AY8b09dXNVvP0opPkXI2As7UtRWsQlJeSHt74wG1xQO9C8GD/HdQDnH/EFSASjHckOmeRVUVaawWhu8Cz/rFlBZcw5BmpWIZZ6JhMtdkEOvVpNW4s0a8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777019; c=relaxed/simple;
	bh=q9mTMLxvul4whV7tkEgI4eYAEuuK1EdO3In/2UP7PQg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q2trKv4sb1rsGMdUSTCLhdAigmUSaVRZNg3XbSxRDhMwW6eCXH9RihP8dAj0jCuXGm7Mxwxxd0Q5Xjkuu0fN8GaboNvFoAYMTCp2Fep3dnmFi2JDzV76KU/JGnnUKjngcQczTc+77sG9PKCs8Jv/StS3lNLyiBIDBf73qpFisrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QELToTa+; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QELToTa+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D2D744428;
	Wed,  5 Feb 2025 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=anGMtlZaLmVBeinR3Dfr3LcM/HrhnXVQcH+JEFzw3jw=;
	b=QELToTa++vMu5fuc7OyZNvBvIG2WvzJtraJ4br3bT0C35KqQNNW9zmVga8G6GElKLeC9u1
	rSm2aUloW/I5hYrlhUmqbCvWc0iqASutx5C9fw1bFZlDygayChp8pzsyBcbzCsZ7R94ec0
	prsp1PNNsQouGaXw8T9F1P6IAP16yni1iWaoeISvctUbJF5KW2KpSVjQsdM5cmnSfF7Gyv
	YSW1rMZkE0MVu7oVE3LK2Yl+3P9oCJVLW4gEOfNA+JNLgjUnMymYXSrkQ/lUtGVGfDG2Q/
	LLE6ij6HDJSVgQaN8LegwzNM7pypSzt0ljEPBKkqm576tqw+LqswVcCccBWMaQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v7 0/9] Fix USB suspend on TI J7200 (cdns3-ti, cdns3, xhci)
Date: Wed, 05 Feb 2025 18:36:45 +0100
Message-Id: <20250205-s2r-cdns-v7-0-13658a271c3c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK2ho2cC/22MQQ7CIBQFr9KwFgPfAq0r72FcAAX7EwUDDdE0v
 bu0C6OJy3l5MzPJLqHL5NjMJLmCGWOooHYNsaMOV0dxqEyAQcsUSJohUTuETFvDO2aHXjLvSb0
 /kvP43FLnS+UR8xTTaysXsa5/IkVQRjspW+MNO4C2JxPjdMOwt/FO1kyRH5UDZ1+qrCp0mivfK
 y40/KrLsrwBRaVeYt0AAAA=
X-Change-ID: 20240726-s2r-cdns-4b180cd960ff
To: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffjeeftddtleetffduteekvdeuiedthfehgfffudehudefheffheehgeeujeevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplgduledvrdduieekrddutddrledvngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgk
 hhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepphgrfigvlhhlsegtrgguvghntggvrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhdrtghhvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

Currently, system-wide suspend is broken on J7200 because of a
controller reset. The TI wrapper does not get re-initialised at resume
and the first register access from cdns core fails. Fix that in:
 - [PATCH v7 5/9] usb: cdns3-ti: move reg writes to separate function
 - [PATCH v7 6/9] usb: cdns3-ti: run HW init at resume() if HW was reset

Four patches imply no/tiny behavior change(s); they are just cleanups.
 - [PATCH v7 1/9] usb: host: xhci-plat: mvebu: use ->quirks instead of ->init_quirk() func
 - [PATCH v7 2/9] usb: xhci: tegra: rename `runtime` boolean to `is_auto_runtime`
 - [PATCH v7 3/9] usb: cdns3: rename hibernated argument of role->resume() to lost_power
 - [PATCH v7 4/9] usb: cdns3: call cdns_power_is_lost() only once in cdns_resume()

The last three patches are the result of discussions on the previous
iterations. We want to let upper layers (platform specific
wrappers) signal to XHCI when a power loss happened and isn't a
surprise.

If we do not signal that, XHCI will dev_warn() about an unexpected
reinit, even though we expected in on our platforms.

What we do is adapt the xhci_resume() arguments from `pm_message_t` to
`bool power_lost, bool is_auto_resume`. Those booleans allow more
expressiveness from callers, including power lost at system-wide resume.

 - [PATCH v7 7/9] usb: xhci: change xhci_resume() parameters to explicit the desired info
 - [PATCH v7 8/9] usb: host: xhci-plat: allow upper layers to signal power loss
 - [PATCH v7 9/9] usb: host: cdns3: forward lost power information to xhci

This thread (on the previous revision of this series) has additional
information: https://lore.kernel.org/lkml/D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com/

Have a nice day,
Thanks,
Théo

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v7:
- New To/Cc for xhci-tegra that gets a new cleanup patch: [PATCH v7 2/9].
- Take "Reviewed-by: Roger Quadros" & remove two empty lines for patch:
  usb: cdns3-ti: move reg writes to separate function
- xhci driver: replace xhci->lost_power by arguments to the
               xhci_resume() function.
- Link to v6: https://lore.kernel.org/r/20241210-s2r-cdns-v6-0-28a17f9715a2@bootlin.com

Changes in v6:
- Drop two upstreamed patches:
  8e3dc6a51cca ("dt-bindings: usb: ti,j721e-usb: fix compatible list")
  d7fad3c5c53e ("arm64: dts: ti: k3-am64: add USB fallback compatible to J721E")
- dt-bindings: fix dt-schema syntax in compatible property.
- Change the approach about xhci->lost_power and the
  XHCI_RESET_ON_RESUME quirk. They are now separate and are checked
  independently at resume. The quirk stays the same, the flag can be
  detected at resume.
- Drop many patches, now that we don't add a new compatible for J7200:
  dt-bindings: usb: ti,j721e-usb: add ti,j7200-usb compatible
  usb: cdns3: add quirk to platform data for reset-on-resume
  usb: cdns3-ti: grab auxdata from match data
  usb: cdns3-ti: add J7200 support with reset-on-resume behavior
  arm64: dts: ti: k3-j7200: use J7200-specific USB compatible
- Link to v5: https://lore.kernel.org/r/20240726-s2r-cdns-v5-0-8664bfb032ac@bootlin.com

Changes in v5:
- dt-bindings: take Reviewed-by Rob and Conor for the first
  patch: "dt-bindings: usb: ti,j721e-usb: fix compatible list".
- cdns3-ti:
  - We now do have HW init code inside cdns_ti_reset_and_init_hw().
  - It gets called at probe unconditionally and from ->runtime_resume()
    if a reset is detected (using the W1 register).
  - Auxdata patches have been reworked now that there is default auxdata
    since commit b50a2da03bd9 ("usb: cdns3-ti: Add workaround for
    Errata i2409"). We now have a patch that moves auxdata to match
    data: "usb: cdns3-ti: grab auxdata from match data".
- cdns3/xhci: those are three new patches.
  - First, we rename "hibernated" to "lost_power" in arguments to
    the role ->resume() callbacks.
  - Then we add the xhci->lost_power flag, and only have it always copy
    the value from XHCI_RESET_ON_RESUME.
  - Finally, we set the flag from the host role driver.
- Link to v4: https://lore.kernel.org/lkml/20240307-j7200-usb-suspend-v4-0-5ec7615431f3@bootlin.com/

Changes in v4:
- dt-bindings: usb: ti,j721e-usb:
  - Remove ti,am64-usb single compatible entry.
  - Reverse ordering of compatible pair j721e + am64
    (becoming am64 + j721e).
  - Add j7200 + j721e compatible pair (versus only j7200). It is the
    same thing as am64: only the integration differs with base j721e
    compatible.
  - NOT taking trailers from Conor as patches changed substantially.
- arm64: dts: ti: j3-j7200:
  - Use j7200 + j721e compatible pair (versus only j7200 previously).
- arm64: dts: ti: j3-am64:
  - Fix to use am64 + j721e compatible pair (versus only am64).
    This is a new patch.
- Link to v3: https://lore.kernel.org/r/20240223-j7200-usb-suspend-v3-0-b41c9893a130@bootlin.com

Changes in v3:
- dt-bindings: use an enum to list compatibles instead of the previous
  odd construct. This is done in a separate patch from the one adding
  J7200 compatible.
- dt-bindings: dropped Acked-by Conor as the changes were modified a lot.
- Add runtime PM back. Put the init sequence in ->runtime_resume(). It
  gets called at probe for all compatibles and at resume for J7200.
- Introduce a cdns_ti_match_data struct rather than rely on compatible
  from code.
- Reorder code changes. Add infrastructure based on match data THEN add
  compatible and its match data.
- DTSI: use only J7200 compatible rather than both J7200 then J721E.
- Link to v2: https://lore.kernel.org/r/20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com

Changes in v2:
- Remove runtime PM from cdns3-ti; it brings nothing. That means our
  cdns3-ti suspend/resume patch is simpler; there is no need to handle
  runtime PM at suspend/resume.
- Do not add cdns3 host role suspend/resume callbacks; they are not
  needed as core detects reset on resume & calls cdns_drd_host_on when
  needed.
- cdns3-ti: Move usb2_refclk_rate_code assignment closer to the value
  computation.
- cdns3/host.c: do not pass XHCI_SUSPEND_RESUME_CLKS quirk to xHCI; it
  is unneeded on our platform.
- Link to v1: https://lore.kernel.org/r/20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com

---
Théo Lebrun (9):
      usb: host: xhci-plat: mvebu: use ->quirks instead of ->init_quirk() func
      usb: xhci: tegra: rename `runtime` boolean to `is_auto_runtime`
      usb: cdns3: rename hibernated argument of role->resume() to lost_power
      usb: cdns3: call cdns_power_is_lost() only once in cdns_resume()
      usb: cdns3-ti: move reg writes to separate function
      usb: cdns3-ti: run HW init at resume() if HW was reset
      usb: xhci: change xhci_resume() parameters to explicit the desired info
      usb: host: xhci-plat: allow upper layers to signal power loss
      usb: host: cdns3: forward lost power information to xhci

 drivers/usb/cdns3/cdns3-gadget.c |   4 +-
 drivers/usb/cdns3/cdns3-ti.c     | 107 +++++++++++++++++++++++++--------------
 drivers/usb/cdns3/cdnsp-gadget.c |   2 +-
 drivers/usb/cdns3/core.c         |   5 +-
 drivers/usb/cdns3/core.h         |   2 +-
 drivers/usb/cdns3/host.c         |  11 ++++
 drivers/usb/host/xhci-histb.c    |   2 +-
 drivers/usb/host/xhci-mvebu.c    |  10 ----
 drivers/usb/host/xhci-mvebu.h    |   6 ---
 drivers/usb/host/xhci-pci.c      |   8 +--
 drivers/usb/host/xhci-plat.c     |  13 ++---
 drivers/usb/host/xhci-plat.h     |   1 +
 drivers/usb/host/xhci-tegra.c    |  10 ++--
 drivers/usb/host/xhci.c          |  19 +++----
 drivers/usb/host/xhci.h          |   2 +-
 15 files changed, 115 insertions(+), 87 deletions(-)
---
base-commit: afb363e0807cb8eb05b6c34307ea3d0412153da5
change-id: 20240726-s2r-cdns-4b180cd960ff

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>

